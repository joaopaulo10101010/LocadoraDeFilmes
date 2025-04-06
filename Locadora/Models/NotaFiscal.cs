namespace Locadora.Models
{
    public class NotaFiscal
    {
        int nt_cod {  get; }
        int cod_cli { get; set; }
        int cod_es { get; set; }
        double nt_valorTotal { get; set; }
        double nt_valorTributos {  get; set; }
        DateTime nt_datatime { get; set; }
        string nt_seguimento { get; set; }
        string nt_outrasInformacoes { get; set; }
    }
}
