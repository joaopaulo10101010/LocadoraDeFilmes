namespace Locadora.Models
{
    public class Clientes
    {
        int cod_cli {  get; }
        string usuario_cli { get; set; }
        string senha_cli { get; set; }
        string nome_cli { get; set; }
        string cpf_cli { get; set; }
        string cep_cli { get; set; }
        string endereco {  get; set; }
        string complemento_cli { get; set; }
        string estado_uf {  get; set; }
        string observacao {  get; set; }
    }
}
