'use strict';

const Dictionary = require("../helpers/dictionary");
const Distributor = require('../helpers/distributor');
const TerraformCommand = require('../terraform-command');

class ApplyCommand extends TerraformCommand {
  /**
   * Command configuration
   */
  configure() {
    this
      .setName('apply')
      .setDescription('run `terraform apply` across multiple terrahub components')
      .addOption('auto-approve', 'y', 'Auto approve terraform execution', Boolean, false)
    ;
  }

  /**
   * @returns {Promise}
   */
  run() {
    const config = this.getConfigObject();
    const distributor = new Distributor(config);

    return this.checkDependencies(config)
      .then(() => this.askForApprovement(config, this.getOption('auto-approve') ))
      .then(answer => answer ?
        distributor.runActions(['prepare', 'workspaceSelect', 'plan', 'apply'], {
          silent: this.getOption('silent'),
          dependencyDirection: Dictionary.DIRECTION.FORWARD
        }) : Promise.reject('Action aborted')
      ).then(() => Promise.resolve('Done'));
  }
}

module.exports = ApplyCommand;
