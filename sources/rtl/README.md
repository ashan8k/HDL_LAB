#READ ME 
#Guide	
cpu.v 
|-->fetch_mem_wr.v (fetching and write to RAM)
|-->decode_control.v (decoding and controlling )
|   |-->control.v
|   |-->decode.v
|-->reg_rd_wr.v (register write and read)
|   |-->register.v
|-->execute.v (alu operations)
    |-->alu.v
