# Converting from JSON format, selecting the parent/child keys "data and then properties" and using a hash table to select the property to export as CSV.
(Get-Content .\20240305110018_computers.json -Raw | ConvertFrom-Json).data.Properties | Select-Object @{Name='Hostname';Expression={$_.name}} | Export-Csv output.csv -NoTypeInformation

# Alternatively selecting 2 seperate values from within seperate nests by using the "Expression" placeholder to define the nested property.
(Get-Content .\graph.json -Raw | ConvertFrom-Json).nodes | Select-Object @{Name='Servers';Expression={$_.label}}, @{Name='OU_Object';Expression={$_.props.distinguishedname}} | Export-Csv output.csv -NoTypeInformation
