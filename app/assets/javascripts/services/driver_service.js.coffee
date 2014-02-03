@Marc.factory 'driverService', ['$resource', ($resource) ->
  $resource '/drivers/:id.json', {id: '@id'},
    update:
      method: 'PUT'
      isArray: false
]
