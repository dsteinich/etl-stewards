create table if not exists org_data_swap_stewards
(data_source_id                 smallint
,data_source                    character varying (8)
,organization_id                numeric
,organization                   VARCHAR(2500)
,organization_name              VARCHAR(2500)
);

-- create table if not exists org_data_swap_stewards partition of org_data for values in (1) with (fillfactor = 100);

create table if not exists project_data_swap_stewards
(data_source_id                 smallint
,data_source                    character varying (8)
,organization                   VARCHAR(2500)
,organization_name              VARCHAR(2500)
,project_identifier             VARCHAR(2500)
,project_name                   VARCHAR(2500)
,description                    VARCHAR(2500)
);

create table if not exists station_swap_stewards
(data_source_id                 smallint
,data_source                    VARCHAR(8)
,station_id                     numeric
,site_id                        VARCHAR(2500)
,organization                   VARCHAR(2500)
,site_type                      VARCHAR(2500)
,huc                            VARCHAR(12)
,governmental_unit_code         VARCHAR(9)
,geom                           VARCHAR(2500) --geometry(point,4269)
,station_name                   VARCHAR(2500)
,organization_name              VARCHAR(2500)
,description_text               VARCHAR(2500)
,station_type_name              VARCHAR(2500)
,latitude                       DECIMAL(12,10)
,longitude                      DECIMAL(13,10)
,map_scale                      VARCHAR(2500)
,geopositioning_method          VARCHAR(2500)
,hdatum_id_code                 VARCHAR(2500)
,elevation_value                VARCHAR(2500)
,elevation_unit                 VARCHAR(2500)
,elevation_method               VARCHAR(2500)
,vdatum_id_code                 VARCHAR(2500)
,drain_area_value               DECIMAL(12,2)
,drain_area_unit                VARCHAR(2500)
,contrib_drain_area_value       numeric
,contrib_drain_area_unit        VARCHAR(2500)
,geoposition_accy_value         VARCHAR(2500)
,geoposition_accy_unit          VARCHAR(2500)
,vertical_accuracy_value        VARCHAR(2500)
,vertical_accuracy_unit         VARCHAR(2500)
,nat_aqfr_name                  VARCHAR(2500)
,aqfr_name                      VARCHAR(2500)
,aqfr_type_name                 VARCHAR(2500)
,construction_date              VARCHAR(2500)
,well_depth_value               numeric
,well_depth_unit                VARCHAR(2500)
,hole_depth_value               numeric
,hole_depth_unit                VARCHAR(2500)
);

create table if not exists activity_swap_stewards 
(data_source_id                 smallint
,data_source                    VARCHAR(8)
,station_id                     numeric
,site_id                        VARCHAR(2500)
,event_date                     date
,activity                        VARCHAR(2500)
,sample_media                        VARCHAR(2500)
,organization                        VARCHAR(2500)
,site_type                        VARCHAR(2500)
,huc                        VARCHAR(2500)
,governmental_unit_code                        VARCHAR(2500)
,geom                        VARCHAR(2500)
,organization_name                        VARCHAR(2500)
,activity_id                    numeric
,activity_type_code                        VARCHAR(2500)
,activity_start_time                        VARCHAR(2500)
,act_start_time_zone                        VARCHAR(2500)
,project_id                        VARCHAR(2500)
,project_name                        VARCHAR(2500)
,monitoring_location_name                        VARCHAR(2500)
,sample_collect_method_id                        VARCHAR(2500)
,sample_collect_method_ctx                        VARCHAR(2500)
,sample_collect_method_name                        VARCHAR(2500)
,sample_collect_equip_name                        VARCHAR(2500)
);

create table if not exists result_swap_stewards 
(data_source_id                 smallint
,data_source                    VARCHAR(8)
,station_id                     numeric
,site_id                        VARCHAR(2500)
,event_date                     date
,activity                        VARCHAR(2500)
,sample_media                        VARCHAR(2500)
,organization                        VARCHAR(2500)
,site_type                        VARCHAR(2500)
,huc                        VARCHAR(2500)
,governmental_unit_code                        VARCHAR(2500)
,geom                        VARCHAR(2500)
,organization_name                        VARCHAR(2500)
,activity_id                    numeric
,activity_type_code                        VARCHAR(2500)
,activity_start_time                        VARCHAR(2500)
,act_start_time_zone                        VARCHAR(2500)
,project_id                        VARCHAR(2500)
,project_name                        VARCHAR(2500)
,monitoring_location_name                        VARCHAR(2500)
,sample_collect_method_id                        VARCHAR(2500)
,sample_collect_method_ctx                        VARCHAR(2500)
,sample_collect_method_name                        VARCHAR(2500)
,sample_collect_equip_name                        VARCHAR(2500)
,result_id                          VARCHAR(2500)
,result_detection_condition_tx      VARCHAR(2500)
,characteristic_name                VARCHAR(2500)
,characteristic_type                VARCHAR(2500)
,sample_fraction_type               VARCHAR(2500)
,result_measure_value               VARCHAR(2500)
,result_unit                        VARCHAR(2500)
,result_value_status                VARCHAR(2500)
,result_value_type                  VARCHAR(2500)
,precision                          VARCHAR(2500)
,result_comment                     VARCHAR(2500)
,analytical_procedure_id            VARCHAR(2500)
,analytical_procedure_source        VARCHAR(2500)
,analytical_method_name             VARCHAR(2500)
,analytical_method_citation         VARCHAR(2500)
,detection_limit                    VARCHAR(2500)
,detection_limit_unit               VARCHAR(2500)
,detection_limit_desc               VARCHAR(2500)
);

create table if not exists r_detect_qnt_lmt_swap_stewards
(data_source_id                 smallint
,data_source                    VARCHAR(8)
,station_id                     numeric
,site_id                        VARCHAR(2500)
,event_date                     date
,activity                       VARCHAR(2500)
,analytical_method              VARCHAR(2500)
,characteristic_name            VARCHAR(2500)
,characteristic_type            VARCHAR(2500)
,sample_media                   VARCHAR(2500)
,organization                   VARCHAR(2500)
,site_type                      VARCHAR(2500)
,huc                            VARCHAR(12)
,governmental_unit_code         VARCHAR(9)
,geom                           VARCHAR(2500)
,project_id                     VARCHAR(2500)
,activity_id                    numeric
,result_id                      numeric
,organization_name              VARCHAR(2500)
,detection_limit_id             numeric
,detection_limit                VARCHAR(2500)
,detection_limit_unit           VARCHAR(2500)
,detection_limit_desc           VARCHAR(2500)
);

create table if not exists ars_org_project
(organization                   VARCHAR(2500)
,organization_name              VARCHAR(2500)
,project_identifier             VARCHAR(2500)
,project_name                   VARCHAR(2500)
,project_description_text       VARCHAR(2500)
);

create table if not exists ars_station
(station_id                                        numeric generated by default as identity (start with 1)
,monitoring_location_identifier                    VARCHAR(2500)
,monitoring_location_name                          VARCHAR(2500)
,monitoring_location_type_name                     VARCHAR(2500)
,monitoring_location_description_text              VARCHAR(2500)
,huc_eight_digit_code                              VARCHAR(2500)
,huc_twelve_digit_code                             VARCHAR(2500)
,drainage_area_measure_value                       VARCHAR(2500)
,drainage_area_measure_unit_code                   VARCHAR(2500)
,latitude_measure                                  VARCHAR(2500)
,longitude_measure                                 VARCHAR(2500)
,horizontal_collection_method_name                 VARCHAR(2500)
,horizontal_coordinate_reference_system_datum_name VARCHAR(2500)
,country_code                                      VARCHAR(2500)
,state_code                                        VARCHAR(2500)
,county_code                                       VARCHAR(2500)
);

create table if not exists ars_result
(result_id                                         numeric generated by default as identity (start with 1)
,activity_identifier  VARCHAR(2500)
,activity_type_code  VARCHAR(2500)
,activity_media_name  VARCHAR(2500)
,activity_start_date  VARCHAR(2500)
,activity_start_time  VARCHAR(2500)
,activity_start_time_zone_code  VARCHAR(2500)
,measure_value  VARCHAR(2500)
,measure_unit_code  VARCHAR(2500)
,activity_depth_height_measure  VARCHAR(2500)
,project_identifier  VARCHAR(2500)
,monitoring_location_identifier  VARCHAR(2500)
,activity_comment_text  VARCHAR(2500)
,sample_collection_method_identifier  VARCHAR(2500)
,sample_collection_method_identifier_context  VARCHAR(2500)
,sample_collection_method_name  VARCHAR(2500)
,sample_collection_method_description_text  VARCHAR(2500)
,sample_collection_equipment_name  VARCHAR(2500)
,sample_collection_equipment_comment_text  VARCHAR(2500)
,result_detection_condition_text  VARCHAR(2500)
,characteristic_name  VARCHAR(2500)
,result_sample_fraction_text  VARCHAR(2500)
,result_measure_value  VARCHAR(2500)
,result_measure_unit_code  VARCHAR(2500)
,result_status_identifier  VARCHAR(2500)
,result_value_type_name  VARCHAR(2500)
,data_quality_precision_value  VARCHAR(2500)
,result_comment_text  VARCHAR(2500)
,result_analytical_method_identifier  VARCHAR(2500)
,result_analytical_method_identifier_context  VARCHAR(2500)
,result_analytical_method_name  VARCHAR(2500)
,result_analytical_method_description_text  VARCHAR(2500)
,detection_quantitation_limit_type_name  VARCHAR(2500)
,detection_quantitation_limit_measure_value  VARCHAR(2500)
,detection_quantitation_limit_measure_unit_code  VARCHAR(2500)
);

create table if not exists ars_site_type_to_primary
(site_type varchar(100)
,primary_site_type varchar(100)
);

create table if not exists ars_char_name_to_type
(characteristic_name            VARCHAR(500)
,characteristic_type            VARCHAR(500)
);