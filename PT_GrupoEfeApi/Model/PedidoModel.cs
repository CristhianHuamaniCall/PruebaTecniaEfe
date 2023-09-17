namespace PT_GrupoEfeApi.Model
{
    public class PedidoModel
    {
        public int pedidoID { get; set; }
        public DateTime fecha { get; set; }     
        public string vendedor { get; set; }
        public string dni { get; set; } 
        public string cliente { get; set; } 
        public List<DetallePedidoModel> DetallePedido { get; set; }
    }
    public class RequestPedidoModel
    {
        public int? pedidoID { get; set; }
        public string? dni { get; set; }
    }

    public class ResponsePedidoModel : ResponseModel
    {
        public List<PedidoModel> Data { get; set; }

    }

}
