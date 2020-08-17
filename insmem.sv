module insmem(input logic [31:0] a,
                output logic [31:0] rd);

logic [31:0] RAM[256:0];
logic [29:0] ins;
assign ins = a[31:2];
initial
    $readmemh("C:/Users/luisd/Documents/ProjectsFPGA/Proyecto_Final(2)/instrucciones.txt",RAM);

    assign rd = RAM[ins]; // word aligned

endmodule