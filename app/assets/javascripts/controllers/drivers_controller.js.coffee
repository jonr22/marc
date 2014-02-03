@Marc.controller 'DriversController', [
  '$scope',
  'driverService',
  ($scope, driverService) ->

    $scope.data =
      drivers: [
        first_name: 'Loading...'
        last_name: ''
      ]

    $scope.addDriver = ->
      save = driverService.save(
        driver:
          first_name: $scope.newDriver.first_name
          last_name: $scope.newDriver.last_name
      )

      save.$promise.then(loadDrivers)
      $scope.newDriver.first_name = ''
      $scope.newDriver.last_name = ''

    $scope.updateDriver = (driver) ->
      update = driverService.update(
        id: driver.id
        driver:
          first_name: driver.first_name
          last_name: driver.last_name
      )
      # update.$promise.then(loadDrivers)
      $scope.toggleEditDriver(driver)

    $scope.removeDriver = (driver) ->
      remove = driverService.remove(id: driver.id)
      remove.$promise.then(loadDrivers)

    $scope.toggleEditDriver = (driver) ->
      driver.editing = !driver.editing

    loadDrivers = ->
      $scope.data.drivers = driverService.query()

    loadDrivers()
]
