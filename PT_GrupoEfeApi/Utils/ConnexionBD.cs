
namespace PT_GrupoEfeApi.Utils
{
    public class ConnexionBD
    {
        private string connectionString = string.Empty;
        public ConnexionBD()
        {
            var constructor = new ConfigurationBuilder().SetBasePath
                (Directory.GetCurrentDirectory()).AddJsonFile
                ("appsettings.json").Build();
            connectionString = constructor.GetSection("ConnectionStrings:connection").Value;
        }

        public string cadenaSQL()
        {
            return connectionString;
        }

    }
}
