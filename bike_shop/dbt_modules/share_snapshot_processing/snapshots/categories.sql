{% snapshot categories_snapshot %}

{{
    config(
        target_database='bikestores_curated_db',
        target_schema='edm',
        unique_key='category_id',

        strategy='timestamp',
        updated_at='load_ts',
    )
}}

SELECT * FROM {{ source('bike_production', 'categories') }}

{% endsnapshot %}
