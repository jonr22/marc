@Marc.controller 'ResultsController', [
  '$scope',
  'seasonService',
  'raceService',
  'driverService',
  'raceClassService',
  'divisionService',
  ($scope, seasonService, raceService, driverService, raceClassService, divisionService) ->

    $scope.data =
      divisions: [
        name: 'Loading...'
      ]
      raceClasses: [
        name: 'Loading...'
      ]
      drivers: [
        first_name: 'Loading...'
        last_name: ''
      ]
      seasons: [
        name: 'Loading...'
      ]
      races: [
        name: 'Loading...'
      ]
      heatCount: 4
      heats: [
        { name: 'Heat 1' }
        { name: 'Heat 2' }
        { name: 'Heat 3' }
        { name: 'Heat 4' }
      ]
      results: [
        driver: ''
        heats: [
          { laps: 0 }
          { laps: 0 }
          { laps: 0 }
          { laps: 0 }
        ]
      ]

    $scope.toggleHeatEditting = (heat) ->
      heat.editing = !heat.editting

    $scope.updateHeat = (heat) ->
      heat.editing = false

    $scope.removeResult = (result) ->
      index = $scope.data.results.indexOf(result)
      $scope.data.results.splice(index, 1)

    $scope.addResult = ->
      heats = []
      heats.push({ laps: 0 }) for heat in $scope.data.heats
      $scope.data.results.push
        driver: ''
        heats: heats

    $scope.removeHeat = (heat) ->
      index = $scope.data.heats.indexOf(heat)
      $scope.data.heats.splice(index, 1)
      result.heats.splice(index, 1) for result in $scope.data.results

    $scope.heatTotal = (result) ->
      total = 0
      for heat in result.heats
        do (heat) ->
          total += Number(heat.laps)
      total

    $scope.addHeat = ->
      heatNumber = ++$scope.data.heatCount
      $scope.data.heats.push { name: "Heat #{heatNumber}" }
      result.heats.push({ laps: 0}) for result in $scope.data.results

    $scope.changeSeason = ->
      loadRaces($scope.selectedSeason)

    loadDrivers = ->
      $scope.data.drivers = driverService.query()

    loadSeasons = ->
      $scope.data.seasons = seasonService.query()

    loadRaces = (season_id) ->
      $scope.data.races = raceService.query({season_id: season_id})

    loadRaceClasses = ->
      $scope.data.raceClasses = raceClassService.query()

    loadDivisions = ->
      $scope.data.divisions = divisionService.query()

    loadDivisions()
    loadRaceClasses()
    loadSeasons()
    loadDrivers()
]
