# cloudbuild for creating VM images
Example of how VM images cacn be created using packer

## Pre-requiste
* Creating a Packer builder image
    * git clone https://github.com/GoogleCloudPlatform/cloud-builders-community.git (This is google builders community )
    * cd cloud-builders-community/packer
    * gcloud builds submit .


## Cloud Build step
* for running the project
* Create a google cloud build with manual trigger to the github repo or any repo
* add Substitute  variables _PROJECT_ID, _ZONE
* run the build
* (you can also have an automated trigger)