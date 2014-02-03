@Marc.controller 'DivisionsController', [
  '$scope',
  'divisionService',
  ($scope, divisionService) ->

    $scope.data =
      divisions: [
        name: 'Loading...'
      ]

    $scope.addDivision = ->
      save = divisionService.save(
        driver_division:
          name: $scope.newDivision
      )
      save.$promise.then(loadDivisions)
      $scope.newDivision = ''

    $scope.updateDivision = (division) ->
      update = divisionService.update(
        id: division.id
        driver_division:
          name: division.name
      )
      update.$promise.then(loadDivisions)
      $scope.toggleEditDivision(division)

    $scope.removeDivision = (division) ->
      remove = divisionService.remove(id: division.id)
      remove.$promise.then(loadDivisions)

    $scope.toggleEditDivision = (division) ->
      division.editing = !division.editing

    loadDivisions = ->
      $scope.data.divisions = divisionService.query()

    loadDivisions()
]
