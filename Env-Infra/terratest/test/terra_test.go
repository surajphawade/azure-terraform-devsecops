package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformRG(t *testing.T) {

	opts := &terraform.Options{
		TerraformDir: "../terraform",
	}

	defer terraform.Destroy(t, opts)
	terraform.InitAndApply(t, opts)

	rg := terraform.Output(t, opts, "rg_name")
	if rg == "" {
		t.Fatal("RG name empty")
	}
}
