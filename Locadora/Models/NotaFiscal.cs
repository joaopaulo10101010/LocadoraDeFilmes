namespace Locadora.Models
{
    public class NotaFiscal
    {
        public int nt_cod {  get; }
        public int cod_cli { get; set; }
        public int cod_es { get; set; }
        public double nt_valorTotal { get; set; }
        public double nt_valorTributos {  get; set; }
        public DateTime nt_datatime { get; set; }
        public string nt_seguimento { get; set; }
        public string nt_outrasInformacoes { get; set; }
    }
}
