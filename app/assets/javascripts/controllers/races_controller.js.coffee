@Marc.controller 'RacesController', [
  '$scope',
  'raceService',
  'seasonService',
  ($scope, raceService, seasonService) ->

    $scope.data =
      races: [
        name: 'Loading...'
      ]
      seasons: [
        name: 'Loading...'
      ]
    $scope.addRace = ->
      save = raceService.save(
        race:
          date: $scope.newRace.date
          venue: $scope.newRace.venue
          notes: $scope.newRace.notes
          season_id: $scope.selectedSeason
      )
      $scope.newRace.date = ''
      $scope.newRace.venue = ''
      $scope.newRace.notes = ''

      save.$promise.then ->
        loadRaces($scope.selectedSeason)

    $scope.updateRace = (race) ->
      update = raceService.update(
        id: race.id
        race:
          name: race.name
      )
      update.$promise.then(loadRaces)
      $scope.toggleEditRace(race)

    $scope.removeRace = (race) ->
      remove = raceService.remove(id: race.id)
      remove.$promise.then(loadRaces)

    $scope.toggleEditRace = (race) ->
      race.editing = !race.editing

    $scope.changeSeason = ->
      loadRaces($scope.selectedSeason)

    loadSeasons = ->
      $scope.data.seasons = seasonService.query()

    loadRaces = (season_id) ->
      $scope.data.races = raceService.query({season_id: season_id})

    loadSeasons()
]
