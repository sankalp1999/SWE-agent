python run.py \
--model_name claude-sonnet-3.5 \
--repo_path /Users/sankalp/Desktop/my-sweagent/SWE-agent/output_restaurant_mgmt_system_flask \
--data_path /Users/sankalp/Desktop/my-sweagent/SWE-agent/issues/issue.md \
--config_file config/codegen.yaml \
--per_instance_cost_limit 4.00 \
--apply_patch_locally \
--environment_setup config/environment_setup/completion.yaml \