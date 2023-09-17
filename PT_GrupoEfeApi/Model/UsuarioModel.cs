namespace PT_GrupoEfeApi.Model
{
    public class UsuarioModel
    {
        public int usuarioID { get; set; }
        public string usuario { get; set; }
        public int rolID { get; set; }
        public string rol { get; set; }
        public string abreviatura { get; set; }
        public string token { get; set; }
    }

    public class RequestUsuarioModel
    {
        public string usuario { get; set; }
        public string password { get; set; }
    }

    public class ResponseUsuarioModel : ResponseModel
    {
        public List<UsuarioModel> Data { get; set; }

    }

}
