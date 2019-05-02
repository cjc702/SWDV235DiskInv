use disk_inventorycc
go
drop procedure if exists sp_ins_borrower
go
create procedure sp_ins_borrower
@disk_id int,
@borrower_id int,
@borrowed_date datetime
as
insert into [dbo].[diskHasBorrower]
				([disk_id]
				,[borrower_id]
				,[borrowed_date])
			values
				(@disk_id
				,@borrower_id
				,@borrowed_date)
go

/*exec sp_ins_visitor 'bob', 'bob@me.com', 'this is funner!'

select * from visitor*/

CREATE LOGIN [disk_inv_cc_login] WITH PASSWORD='Pa$$w0rd', DEFAULT_DATABASE=[disk_inventorycc]
go
use disk_inventorycc
go
CREATE USER [disk_inv_cc_login] FOR LOGIN [disk_inv_cc_login] WITH DEFAULT_SCHEMA=[dbo]
GO
grant execute on sp_ins_borrower to disk_inv_cc_login
go
