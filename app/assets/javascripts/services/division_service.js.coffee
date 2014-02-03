@Marc.factory 'divisionService', ['$resource', ($resource) ->
  $resource '/driver_divisions/:id.json', {id: '@id'},
    update:
      method: 'PUT'
      isArray: false
]
