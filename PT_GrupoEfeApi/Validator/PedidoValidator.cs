using FluentValidation;
using Microsoft.AspNetCore.Components.Forms;
using Microsoft.VisualBasic;
using PT_GrupoEfeApi.Model;

namespace PT_GrupoEfeApi.Validator
{
    public class PedidoValidator: AbstractValidator<RequestPedidoModel>
    {
        public PedidoValidator() 
        {
            RuleFor(x => x.pedidoID).NotNull()
                .WithErrorCode("el valor no puede ser Nulo");

        }
    }
}
