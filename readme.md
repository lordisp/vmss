
Run Azure CLI to VMSS:

```
az vmss extension set 
    --publisher Microsoft.Azure.Extensions 
    --version 2.0 
    --name CustomScript 
    --resource-group $resourceGroup 
    --vmss-name $scaleSet 
    --settings '{"fileUris":["https://raw.githubusercontent.com/lordisp/vmss/main/install-php.sh"],"commandToExecute":"./install-php.sh"}'
```