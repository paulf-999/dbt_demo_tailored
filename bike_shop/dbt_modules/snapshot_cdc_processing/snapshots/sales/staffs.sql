{% snapshot staffs %}

{{
    config(
        target_database='bike_shop_snapshot_proc_db',
        target_schema='sales',
        unique_key='staff_id',

        strategy='timestamp',
        updated_at='load_ts',
    )
}}

SELECT * FROM {{ source('bike_sales', 'staffs') }}

{% endsnapshot %}
