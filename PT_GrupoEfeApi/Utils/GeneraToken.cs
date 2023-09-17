using Microsoft.IdentityModel.Tokens;
using PT_GrupoEfeApi.Interface;
using PT_GrupoEfeApi.Model;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace PT_GrupoEfeApi.Utils
{
    public class GeneraToken : IGeneraToken
    {
        public IConfiguration _configuration;
        public GeneraToken(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public dynamic CreaToken(string login)
        {
            var jwt = _configuration.GetSection("Jwt").Get<JwtModel>();

            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub,jwt.Subject),
                new Claim(JwtRegisteredClaimNames.Jti,Guid.NewGuid().ToString()),
                new Claim(JwtRegisteredClaimNames.Iat,DateTime.UtcNow.ToString()),
                new Claim("usuario",login)
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwt.Key));
            var singIn = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                jwt.Issuer,
                jwt.Audience,
                claims,
                expires: DateTime.Now.AddMinutes(60),
                signingCredentials: singIn
                );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }


    }
}
