l1_TestimagesAgainstDatabase_hist = myFunctionTestCCV('../images/test_images/', '../images/database/', 12, 0.01, 512, 8, 1)
l1_TestimagesAgainstDatabase_ccv = myFunctionTestCCV('../images/test_images/', '../images/database/', 12, 0.01, 512, 8, 2)
l1_TestimagesAgainstDatabase_sucRef = myFunctionTestCCVwithSucRef('../images/test_images/', '../images/database/', 12, 0.01, 512, 8, 2, 0.75)
l1_DatabaseAgainstTestimages_hist = myFunctionTestCCV('../images/database/', '../images/test_images/', 12, 0.01, 512, 8, 1)
l1_DatabaseAgainstTestimages_ccv = myFunctionTestCCV('../images/database/', '../images/test_images/', 12, 0.01, 512, 8, 2)
l1_DatabaseAgainstTestimages_sucRef = myFunctionTestCCVwithSucRef('../images/database/', '../images/test_images/', 12, 0.01, 512, 8, 2, 0.75)