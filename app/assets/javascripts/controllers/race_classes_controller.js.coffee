@Marc.controller 'RaceClassesController', [
  '$scope',
  'raceClassService',
  ($scope, raceClassService) ->

    $scope.data =
      raceClasses: [
        name: 'Loading...'
      ]

    $scope.addRaceClass = ->
      save = raceClassService.save(
        race_class:
          name: $scope.newRaceClass
      )
      save.$promise.then(loadRaceClasses)
      $scope.newRaceClass = ''

    $scope.updateRaceClass = (raceClass) ->
      update = raceClassService.update(
        id: raceClass.id
        race_class:
          name: raceClass.name
      )
      update.$promise.then(loadRaceClasses)
      $scope.toggleEditRaceClass(raceClass)

    $scope.removeRaceClass = (raceClass) ->
      remove = raceClassService.remove(id: raceClass.id)
      remove.$promise.then(loadRaceClasses)

    $scope.toggleEditRaceClass = (raceClass) ->
      raceClass.editing = !raceClass.editing

    loadRaceClasses = ->
      $scope.data.raceClasses = raceClassService.query()

    loadRaceClasses()
]
