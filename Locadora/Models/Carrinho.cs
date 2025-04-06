namespace Locadora.Models
{
    public class Carrinho
    {
        public int car_cod {  get; }
        public int cod_es { get; set; }
        public int cod_cli {  get; set; }
        public int filme_cod { get; set; }
        public int car_quantidade { get; set; }
        public DateTime car_datetime { get; set; }

    }
}
