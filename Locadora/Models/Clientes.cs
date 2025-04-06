namespace Locadora.Models
{
    public class Clientes
    {
        public int cod_cli {  get; }
        public string usuario_cli { get; set; }
        public string senha_cli { get; set; }
        public string nome_cli { get; set; }
        public string cpf_cli { get; set; }
        public string cep_cli { get; set; }
        public string endereco {  get; set; }
        public string complemento_cli { get; set; }
        public string estado_uf {  get; set; }
        public string observacao {  get; set; }
    }
}
