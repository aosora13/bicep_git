param location string = resourceGroup().location
param storageName string = 'bicepstgacct03212024'
param namePrefix string = 'tomsbicep2'
targetScope = 'resourceGroup'

param dockerImage string = 'ubuntu/nginx'
param dockerImageTag string = 'latest'

module storage'modules/storage.bicep' = {
  name: storageName
  params:{
      storageName: storageName
      location: location
    }
  }

  module appPlanDeploy 'modules/servicePlan.bicep' = {
    name: 'appPlanDeploy'
    params: {
      namePrefix:namePrefix
      location: location
    }
  }

  module webapp 'modules/webApp.bicep' = {
    name: '${namePrefix}-deploy-website'
    params: {
      appPlanId: appPlanDeploy.outputs.planId
      location:location
      dockerImage:dockerImage
      dockerImageTag:dockerImageTag

    }
  }

  output siteUrl string = webapp.outputs.siteUrl

//param location string = resourceGroup().location
//param storageName string = 'bicep${uniqueString(resourceGroup().id)}'
//resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
 // name: storageName
 // location: location
 // kind: 'StorageV2'
//  sku: {
 //   name: 'Premium_LRS'
 // }
 // properties: {
 //   accessTier: 'Hot'
 // }
//}

// var nameArray = [
 // 'Tom'
 // 'Andrew'
// ]

// output result string = nameArray[0]

//var person = {
//  name: 'Jay'
//  lastName: 'Rite'
 // age: 34
 // isMarried: false
 // educations: {
 //   college: 'UW'
//    year: 1987
//  }
//}

//output result string = person.educations.college

//resource appServicePlan 'Microsoft.Web/serverfarms@2023-01-01' = {
 // name: 'xyz${storageName}'
 // location: location
 // sku:{
  //  name: 'F1'
 // }
//}

//resource webApplication 'Microsoft.Web/sites@2023-01-01' = {
  //name: 'zed${storageName}'
 // location: location
  //properties: {
  //  serverFarmId: appServicePlan.id
  //  httpsOnly:true
 // }
//}




//param location string = 'centralus'
//param StorageName string = 'gastorage1326'

//resource storageaccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  //name: StorageName
  //location: location
  //kind: 'StorageV2'
  //sku: {
    //name: 'Premium_LRS'
  //}
//}

