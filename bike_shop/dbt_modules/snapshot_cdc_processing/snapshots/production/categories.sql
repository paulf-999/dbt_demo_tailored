{% snapshot categories %}

{{
    config(
        target_database='bike_shop_snapshot_proc_db',
        target_schema='production',
        unique_key='category_id',

        strategy='timestamp',
        updated_at='load_ts',
    )
}}

SELECT * FROM {{ source('bike_production', 'categories') }}

{% endsnapshot %}
