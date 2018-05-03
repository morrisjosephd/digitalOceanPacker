## Digital Ocean - Packer Base Image Builder

This image builder provisions a Digital Ocean droplet and secures it.  Of note, it removes the ability to log in as
the root user and the ability to use a password.  A new user is created and a ssh key is placed on the server.

Validate the packer build
`packer validate -var-file=variables.json digitalOceanBaseImage.json`

Build a Digital Ocean Image
`packer build -var-file=variables.json -except=null digitalOceanBaseImage.json`

An image is created on Digital Ocean.  Create a droplet from it and select an ssh key to be added to the droplet during
creation.


##### This doesn't work at the moment.  Permission errors.
Create a droplet from the image and place the ip address in the `variables.json` file
`packer build -var-file=variables.json -only=null digitalOceanBaseImage.json`
