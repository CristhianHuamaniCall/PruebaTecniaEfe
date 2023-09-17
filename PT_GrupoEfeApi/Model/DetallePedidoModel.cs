namespace PT_GrupoEfeApi.Model
{
    public class DetallePedidoModel
    {
        public int productoID { get; set; }
        public string producto { get; set; }
        public int cantidad { get; set; }
        public decimal precioUnitario { get; set; }
        public decimal SubTotal { get; set; }
    }
    public class RequestDetallePedidoModel
    {
        public int? pedidoID { get; set; }
    }
}
