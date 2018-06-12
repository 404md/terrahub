resource "random_string" "hash" {
  length  = 16
  special = false
}

resource "aws_cloudfront_distribution" "{{ name }}" {
  # top level
  aliases                = ["${var.aliases}"]
  ordered_cache_behavior = ["${var.ordered_cache_behavior}"]
  comment                = "${var.comment}"
  custom_error_response  = ["${var.custom_error_response}"]
  default_root_object    = "${var.default_root_object}"
  enabled                = "${var.enabled}"
  is_ipv6_enabled        = "${var.is_ipv6_enabled}"
  http_version           = "${var.http_version}"
  price_class            = "${var.price_class}"

  # cache behavior
  default_cache_behavior {
    allowed_methods        = "${var.allowed_methods}"
    cached_methods         = "${var.cached_methods}"
    compress               = "${var.compress}"
    default_ttl            = "${var.default_ttl}"
    max_ttl                = "${var.max_ttl}"
    default_ttl            = "${var.default_ttl}"
    min_ttl                = "${var.min_ttl}"
    target_origin_id       = "${var.origin_id}-${random_string.hash.result}"
    viewer_protocol_policy = "${var.viewer_protocol_policy}"

    forwarded_values {
      headers      = ["${var.forward_headers}"]
      query_string = "${var.forward_query_string}"
      query_string_cache_keys = "${var.query_string_cache_keys}"

      cookies {
        forward           = "${var.forward_cookies}"
        whitelisted_names = ["${var.forward_cookies_whitelisted_names}"]
      }
    }
  }

  # logging config
  #logging_config = {
  #  bucket          = "${var.log_s3_bucket}"
  #  prefix          = "${var.log_s3_prefix}"
  #  include_cookies = "${var.log_include_cookies}"
  #}

  # origin config
  origin {
    domain_name = "${var.origin_domain_name}"
    origin_id   = "${var.origin_id}-${random_string.hash.result}"
    origin_path = "${var.origin_path}"

    custom_origin_config {
      http_port                = "${var.origin_http_port}"
      https_port               = "${var.origin_https_port}"
      origin_protocol_policy   = "${var.origin_protocol_policy}"
      origin_ssl_protocols     = "${var.origin_ssl_protocols}"
      origin_keepalive_timeout = "${var.origin_keepalive_timeout}"
      origin_read_timeout      = "${var.origin_read_timeout}"
    }
  }
  # restrictions
  restrictions {
    geo_restriction {
      restriction_type = "${var.geo_restriction_type}"
      locations        = "${var.geo_restriction_locations}"
    }
  }
  # viewer certificate
  viewer_certificate {
    acm_certificate_arn            = "${var.acm_certificate_arn}"
    ssl_support_method             = "${var.ssl_support_method}"
    minimum_protocol_version       = "${var.minimum_protocol_version}"
    cloudfront_default_certificate = "${var.cloudfront_default_certificate}"
  }
  custom_error_response = {
    error_caching_min_ttl = "300"
    error_code            = "404"
    response_code         = "200"
    response_page_path    = "/index.html"
  }
  tags = "${var.default_tags}"
}
