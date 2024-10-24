#!/bin/bash

# Run the SWE-agent with Claude 3 Sonnet
python run.py \
--model_name claude-sonnet-3.5 \
--repo_path ../output_restaurant_mgmt_system_flask \
--data_path issues/issue.md \
--config_file config/codegen.yaml \
--per_instance_cost_limit 2.00 \
--apply_patch_locally \
--environment_setup config/environment_setup/codegen_dependencies.yaml \
--skip_existing=false \
--suffix=v1

# Parameter explanations:
# --model_name claude-3-sonnet-20240229  # The Claude 3 Sonnet model (latest version)
# --repo_path ...                        # Path to your Flask restaurant management system
# --data_path issues/issue.md            # Path to your issue description file
# --config_file config/codegen.yaml      # Configuration for prompts and templates
# --per_instance_cost_limit 4.00         # Maximum cost limit per instance in dollars
# --apply_patch_locally                  # Apply generated patches to the repository
# --environment_setup ...                # Python dependencies setup (Flask, pytest, etc.)
