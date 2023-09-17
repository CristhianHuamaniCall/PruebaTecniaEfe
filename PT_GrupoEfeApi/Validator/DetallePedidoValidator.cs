using FluentValidation;
using PT_GrupoEfeApi.Model;

namespace PT_GrupoEfeApi.Validator
{
    public class DetallePedidoValidator : AbstractValidator<RequestDetallePedidoModel>
    {
        public DetallePedidoValidator()
        {
            RuleFor(x => x.pedidoID).NotNull()
                .WithErrorCode("el valor no puede ser Nulo");

        }
    }
}
