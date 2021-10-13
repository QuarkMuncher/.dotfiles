#!/home/Master/.nvm/versions/node/v15.11.0/bin/node
const cli = require('docker-cli-js');
var options = new cli.Options(null, null, false);
var docker = new cli.Docker(options);

docker.command('ps', function (err, data){
	data.containerList.forEach(container => {
		  docker.command(`inspect ${container['container id']}`, (err, data) => {
          data.object.forEach(info => {
              console.log(info.NetworkSettings.Networks);
          });
		});
	});
});
