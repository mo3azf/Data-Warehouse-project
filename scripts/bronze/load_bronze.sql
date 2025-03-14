create or alter procedure bronze.load_bronze as
begin
	declare @start_time datetime,@end_time datetime,@bathch_start_time datetime,@bathch_end_time datetime;

	begin try
		set @bathch_start_time = GETDATE();
		print '=============================================';
		print 'loading the bronze layer';
		print '=============================================';


		print'----------------------------------------------';
		print 'loading CRM tables';
		print'----------------------------------------------';

		set @start_time = GETDATE();
		print'>> truncating table : crm_cust_info ';
		truncate table bronze.crm_cust_info
		print'>> inserting data into: crm_cust_info ';
		bulk insert bronze.crm_cust_info
		from 'C:\Users\mo3az\Desktop\Data Warehouse and Analytics Project\datasets\source_crm\cust_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);		
		set @end_time = GETDATE();
		print '>> load duration: ' + cast(datediff(second, @start_time,@end_time)as nvarchar)+ ' seconds'
		print'----------------------------------------------';



		set @start_time = GETDATE();
		print'>> truncating table : crm_prd_info ';
		truncate table bronze.crm_prd_info
		print'>> inserting data into: crm_prd_info ';
		bulk insert bronze.crm_prd_info
		from 'C:\Users\mo3az\Desktop\Data Warehouse and Analytics Project\datasets\source_crm\prd_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print '>> load duration: ' + cast(datediff(second, @start_time,@end_time)as nvarchar)+ ' seconds'
		print'----------------------------------------------';


		set @start_time = GETDATE();
		print'>> truncating table : crm_sales_details ';
		truncate table bronze.crm_sales_details
		print'>> inserting data into: crm_sales_details ';
		bulk insert bronze.crm_sales_details
		from 'C:\Users\mo3az\Desktop\Data Warehouse and Analytics Project\datasets\source_crm\sales_details.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print '>> load duration: ' + cast(datediff(second, @start_time,@end_time)as nvarchar)+ ' seconds'
		print'----------------------------------------------';




		print'----------------------------------------------';
		print 'loading ERP tables';
		print'----------------------------------------------';


		set @start_time = GETDATE();
		print'>> truncating table : erp_cust_az12 ';
		truncate table bronze.erp_cust_az12
		print'>> inserting data into: erp_cust_az12 ';
		bulk insert bronze.erp_cust_az12
		from 'C:\Users\mo3az\Desktop\Data Warehouse and Analytics Project\datasets\source_erp\CUST_AZ12.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print '>> load duration: ' + cast(datediff(second, @start_time,@end_time)as nvarchar)+ ' seconds'
		print'----------------------------------------------';


		set @start_time = GETDATE();
		print'>> truncating table : erp_loc_a101 ';
		truncate table bronze.erp_loc_a101
		print'>> truncating table : erp_loc_a101 ';
		bulk insert bronze.erp_loc_a101
		from 'C:\Users\mo3az\Desktop\Data Warehouse and Analytics Project\datasets\source_erp\LOC_A101.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print '>> load duration: ' + cast(datediff(second, @start_time,@end_time)as nvarchar)+ ' seconds'
		print'----------------------------------------------';


		set @start_time = GETDATE();
		print'>> truncating table : erp_px_cat_g1v2 ';
		truncate table bronze.erp_px_cat_g1v2
		print'>> truncating table : erp_px_cat_g1v2 ';
		bulk insert bronze.erp_px_cat_g1v2
		from 'C:\Users\mo3az\Desktop\Data Warehouse and Analytics Project\datasets\source_erp\PX_CAT_G1V2.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print '>> load duration: ' + cast(datediff(second, @start_time,@end_time)as nvarchar)+ ' seconds'
		print'----------------------------------------------';

		set @bathch_end_time = GETDATE();
		print'=========================================='
		print'loading bronze layer is completed ';
		print '  - total load duration: ' +cast(datediff(second,@bathch_start_time, @bathch_end_time) as nvarchar) + ' second'
		print '==========================================='


	end try
	begin catch
	print ' =========================================='
	print ' error occured during loding bronze layer'
	print 'error message' + error_message();
	print 'error message' + cast (error_number() as nvarchar);
	print 'error message' + cast (error_state() as nvarchar);

	print ' =========================================='

	end catch
end
