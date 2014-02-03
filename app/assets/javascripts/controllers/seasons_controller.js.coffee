@Marc.controller 'SeasonsController', [
  '$scope',
  'seasonService',
  ($scope, seasonService) ->

    $scope.data =
      seasons: [
        name: 'Loading...'
      ]

    $scope.addSeason = ->
      save = seasonService.save(
        season:
          name: $scope.newSeason
      )
      save.$promise.then(loadSeasons)
      $scope.newSeason = ''

    $scope.updateSeason = (season) ->
      update = seasonService.update(
        id: season.id
        season:
          name: season.name
      )
      update.$promise.then(loadSeasons)
      $scope.toggleEditSeason(season)

    $scope.removeSeason = (season) ->
      remove = seasonService.remove(id: season.id)
      remove.$promise.then(loadSeasons)

    $scope.toggleEditSeason = (season) ->
      season.editing = !season.editing

    loadSeasons = ->
      $scope.data.seasons = seasonService.query()

    loadSeasons()
]
