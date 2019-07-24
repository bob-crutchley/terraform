# Terraform with GCP
This is a Terraform project for reference purposes, showing how to configure and provision a virtual macine on GCP. This project can only configure one VM at a time, what is intalled on the VM will depend on what scripts were executed, which is determined by the variable files.

## Provider & Authentication
To be able to access GCP using Terraform you will need to create a service account that can create and modify compute resources, a compute admin role for instance. You will also need to create a credentials file for this service account and save it in `~/.gcp/terraform_key.json`.

## Project Setup
The correct project must be configured in the `00_default_variables.tf` file. You can find your project id by running `gcloud config list`.

## Running the Project
All the commands have been stored in `Makefile` to make running this project easier, you can look in this file for seeing how the variable files are used. An example for setting up the python server that has bee configured would be as follows: `make python-systemd-http-server-apply`
