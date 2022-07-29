package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
)

func Test_SingleInstance_SingleRegion(t *testing.T) {
	t.Parallel()
	// Variables
	UniqueId := random.UniqueId()
	resourceName := UniqueId
	locations := []string{"UK South"}
	instance_count := 1

	// Root folder where terraform files should be (relative to the test folder)
	rootFolder := "../"

	// Relative path to terraform module being tested from the root folder
	terraformFolderRelativeToRoot := "./examples/"

	// Copy the terraform folder to a temp folder
	tempTestFolder := test_structure.CopyTerraformFolderToTemp(t, rootFolder, terraformFolderRelativeToRoot)

	// Make sure to use the temp test folder in the terraform options
	terraformOptions := &terraform.Options{
		TerraformDir: tempTestFolder,

		// retryable errors in terraform testing.
		// terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// 	TerraformDir: "../examples",

		// Variables to pass to the Terraform code using -var options
		Vars: map[string]interface{}{
			"location":                locations,
			"resource_instance_count": instance_count,
			"unique_ID":               resourceName,
		},
	}

	// defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndPlan(t, terraformOptions)

	// output := terraform.Output(t, terraformOptions, "hello_world")
	// assert.Equal(t, "Hello, World!", output)
}

// func Test_SingleInstance_SingleRegion_SingleDDisk(t *testing.T) {
// 	t.Parallel()

// 	// Variables
// 	locations := []string{"UK South"}
// 	instance_count := 1
// 	data_disks := 1

// 	// retryable errors in terraform testing.
// 	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
// 		TerraformDir: "../examples",

// 		// Variables to pass to the Terraform code using -var options
// 		Vars: map[string]interface{}{
// 			"location":                locations,
// 			"resource_instance_count": instance_count,
// 			"data_disk_count":         data_disks,
// 		},
// 	})

// 	// defer terraform.Destroy(t, terraformOptions)

// 	terraform.InitAndPlan(t, terraformOptions)

// 	// output := terraform.Output(t, terraformOptions, "hello_world")
// 	// assert.Equal(t, "Hello, World!", output)
// }

// func Test_SingleInstance_SingleRegion_MultiDDisk(t *testing.T) {
// 	t.Parallel()

// 	// Variables
// 	locations := []string{"UK South"}
// 	instance_count := 1
// 	data_disks := 2

// 	// retryable errors in terraform testing.
// 	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
// 		TerraformDir: "../examples",

// 		// Variables to pass to the Terraform code using -var options
// 		Vars: map[string]interface{}{
// 			"location":                locations,
// 			"resource_instance_count": instance_count,
// 			"data_disk_count":         data_disks,
// 		},
// 	})

// 	// defer terraform.Destroy(t, terraformOptions)

// 	terraform.InitAndPlan(t, terraformOptions)

// 	// output := terraform.Output(t, terraformOptions, "hello_world")
// 	// assert.Equal(t, "Hello, World!", output)
// }

// func Test_MultiInstance_SingleRegion_AvailZone(t *testing.T) {
// 	t.Parallel()
// 	// Variables
// 	locations := []string{"UK South"}
// 	instance_count := 4

// 	// retryable errors in terraform testing.
// 	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
// 		TerraformDir: "../examples",

// 		// Variables to pass to the Terraform code using -var options
// 		Vars: map[string]interface{}{
// 			"location":                locations,
// 			"resource_instance_count": instance_count,
// 		},
// 	})

// 	// defer terraform.Destroy(t, terraformOptions)

// 	terraform.InitAndPlan(t, terraformOptions)

// 	// output := terraform.Output(t, terraformOptions, "hello_world")
// 	// assert.Equal(t, "Hello, World!", output)
// }

// func Test_SingleInstance_MultiRegion_AvailZone_AvailSet(t *testing.T) {
// 	t.Parallel()
// 	// Variables
// 	locations := []string{"UK South", "France Central"}
// 	instance_count := 1

// 	// retryable errors in terraform testing.
// 	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
// 		TerraformDir: "../examples",

// 		// Variables to pass to the Terraform code using -var options
// 		Vars: map[string]interface{}{
// 			"location":                locations,
// 			"resource_instance_count": instance_count,
// 		},
// 	})

// 	// defer terraform.Destroy(t, terraformOptions)

// 	terraform.InitAndPlan(t, terraformOptions)

// 	// output := terraform.Output(t, terraformOptions, "hello_world")
// 	// assert.Equal(t, "Hello, World!", output)
// }
