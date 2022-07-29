// package test

// import (
// 	"testing"

// 	"github.com/gruntwork-io/terratest/modules/terraform"
// )

// func Test_SingleInstance_SingleRegion(t *testing.T) {
// 	//	t.Parallel()

// 	// Variables
// 	locations := []string{"UK South"}
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

// func Test_SingleInstance_SingleRegion_SingleDDisk(t *testing.T) {
// 	//	t.Parallel()

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
// 	// t.Parallel()

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

// 	// Variables
// 	locations := []string{"UK South", "North Europe"}
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
