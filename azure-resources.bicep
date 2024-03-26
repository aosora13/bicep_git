param location string = 'centralus'
param StorageName string = 'ga-storage132'

resource storageaccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: StorageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}

