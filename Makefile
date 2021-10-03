SHELL = /bin/sh

export DBT_PROFILE_NAME=dbt_svc_profile
export DBT_PROJECT_NAME=bike_shop
export DBT_MODEL=curated_db
export PROGRAM=BIKE_SHOP

validate_conn:
	$(info [+] Verify the connection to the source DB)
	cd ${DBT_PROJECT_NAME} && dbt debug --profiles-dir=profiles

run_model:
	$(info [+] Run the DBT model)
	cd ${DBT_PROJECT_NAME} && dbt run --profiles-dir profiles --models ${DBT_MODEL}

#document_model:
#	$(info [+] Document the DBT model)
#	cd ${DBT_PROJECT_NAME} && dbt docs generate --profiles-dir profiles
#	cd ${DBT_PROJECT_NAME} && dbt docs serve --profiles-dir profiles

run_generic_tests:
	$(info [+] Test the DBT model. Note: this tests the actual data against predefined business rules)
	# prerequisite: populate ${DBT_PROJECT_NAME}/models/schema.yml with any desired tests
	cd ${DBT_PROJECT_NAME} && dbt test --schema --profiles-dir profiles

run_bespoke_tests:
	$(info [+] Test the DBT model. Note: this is a schema test only and is useful only for loading new data (enforces uniqueness))
	# prerequisite: populate ${DBT_PROJECT_NAME}/models/schema.yml with any desired tests
	cd ${DBT_PROJECT_NAME} && dbt test --profiles-dir profiles --models ${DBT_MODEL}

test_and_build:
	$(info [+] Test then if successful, build the DBT model)
	cd ${DBT_PROJECT_NAME} && dbt test --profiles-dir profiles --models ${DBT_MODEL}
	# following successful DBT tests, then run the DBT model
	cd ${DBT_PROJECT_NAME} && dbt run --profiles-dir profiles --models ${DBT_MODEL}

write_to_log_demo:
	@echo "[$(shell date)]" 2>&1 | tee  -a logs/dbt_cmds.log && cd ${DBT_PROJECT_NAME} && dbt deps --profiles-dir=profiles 2>&1 | tee  -a  ../../../logs/dbt_cmds.log

########################
# project-specific demo
########################
run_model_dq_db:
	cd ${DBT_PROJECT_NAME}/dbt_modules/data_quality && dbt run --profiles-dir profiles

run_snapshots:
	cd ${DBT_PROJECT_NAME} && dbt snapshot --profiles-dir dbt_modules/snapshot_cdc_processing/profiles

run_dwh_model_raw_db:
	$(info [+] Run the DBT model)
	cd ${DBT_PROJECT_NAME} && dbt run --profiles-dir profiles --models raw_db

run_dwh_model_curated_db:
	$(info [+] Run the DBT model)
	cd ${DBT_PROJECT_NAME} && dbt run --profiles-dir profiles --models curated_db

document_model:
	$(info [+] Document the DBT model)
	cd ${DBT_PROJECT_NAME} && dbt docs generate --profiles-dir profiles
	cd ${DBT_PROJECT_NAME} && dbt docs serve --profiles-dir profiles
