Nesta página irei descrever como integrar o VIM às funções básicas do TFS. Como isso funciona? Criei um script no .vimrc que basicamente faz chamadas ao executável do tfs e realiza as operações através de funções: Get, Add, Delete, Undo, Checkout, Checkin, Shelve, Unshelve. Basicamente uma interface amigável à linha de comando do TFS. O script está disponível em um gist no GitHub: [vimrc for integration with TFS][1] . Adicione-o ao seu .vimrc e você terá acesso às funções: 

*   **TFget:** Pega a última versão disponível do arquivo, ou diretório.
*   **TFadd, TFdelete:** Adiciona/Deleta um arquivo do versionamento.
*   **TFundo:** Restaura as modificações feitas no arquivo para a última do versionamento.
*   **TFshelve, TFunshelve:** Guarda/Restaura modificações no changeset.
*   **TFcheckout, TFcheckin:** Faz checkout/checkin do arquivo/diretório.
*   **TFhistory:** Mostra o histórico no versionamento.

 [1]: https://gist.github.com/1142264 

Por padrão todos os comandos são rodados sem recursividade e devem ter como o argumento o caminho de um diretório ou arquivo. Para adicionar recursividade passe o parâmetro `-R`. Ou mude o padrão para ser recursivo no .vimrc. 

Para se obter o nome do arquivo que se está alterando no momento, utilize `%:p`. Por exemplo, ao adicionar um arquivo para o versionamento faço o seguinte procedimento. Crio o arquivo, escrevo ele (mesmo vazio) e rodo `:TFadd %:p`, ao término da criação basta dar checkin: `:TFcheckin %:p`. 

Não se esqueça de verificar se o caminho do executável do tfs está correto no .vimrc. Para mudar basta mudar ou rodar a função com o argumento correto `:TFsetbin("C:\...")`. 

Um plugin altamente recomendado para se navegar pelo filesystem é o NERDTree. Disponível em <http://www.vim.org/scripts/script.php?script_id=1658>. Recomendo fortemente este tutorial recente no NetTutsPlus: <http://net.tutsplus.com/tutorials/other/vim-essential-plugin-nerdtree>. 

Em tempo, referências para TFS via linha de comando: 

 [Operações][http://msdn.microsoft.com/en-us/library/z51z7zy0(v=vs.80).aspx] 
 [Informações][http://msdn.microsoft.com/en-us/library/ms181450(v=vs.80).aspx] 

Saudações, Amadeus. 
