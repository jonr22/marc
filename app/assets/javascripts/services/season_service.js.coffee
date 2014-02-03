@Marc.factory 'seasonService', ['$resource', ($resource) ->
  $resource '/seasons/:id.json', {id: '@id'},
    update:
      method: 'PUT'
      isArray: false
]
