#!/bin/bash


# Run the SWE-agent
python run.py \
--model_name claude-sonnet-3.5 \
--repo_path output_restaurant_mgmt_system_flask \
--data_path issues/issue.md \
--config_file config/codegen.yaml \
--per_instance_cost_limit 4.00 \
--apply_patch_locally \
--environment_setup config/environment_setup/completion.yaml

# You can add comments after each parameter to explain what it does
# For example:
# --model_name claude-sonnet-3.5    # Specifies the AI model to use
# --repo_path ...                   # Path to the repository
# --data_path ...                   # Path to the issue file
# --config_file ...                 # Path to the configuration file - contains system prompt and instance template
# --per_instance_cost_limit ...    # Cost limit per instance
# --apply_patch_locally ...         # Apply patch locally (i believe only on the repo in the docker for now)
# --environment_setup ...         # install additional python dependencies like flask, pytest (not 100% sure if this works)
