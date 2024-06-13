document.addEventListener('DOMContentLoaded', async () => {
  await displayProposals()
})

function showLoading() {
  document.getElementById('loadingOverlay').classList.add('visible');
}

function hideLoading() {
  document.getElementById('loadingOverlay').classList.remove('visible');
}

const setupWeb3 = async () => {
  try {
    let currentProvider = null
    if (window.ethereum) {
      await window.ethereum.enable()
      currentProvider = window.ethereum
    } else if (window.web3) {
      currentProvider = window.web3.currentProvider
    } else {
      window.open('https://metamask.app.link/dapp/your.example.com', '_blank');
    }
    if (currentProvider) {
      const web3 = new Web3(currentProvider)
      const chainId = await web3.eth.getChainId()
      if (chainId != 11155111) {
        alert('Please switch to Sepolia network')
        return
      }
      const accounts = (await web3.eth.getAccounts()) || web3.eth.accounts
      const account = accounts[0]
      return {web3, chainId, account}
    }
  } catch (err) {
    console.log(err)
  }
}

const getContract = async () => {
  const {web3, chainId, account} = await setupWeb3()
  const contract = new web3.eth.Contract(ContractABI, ContractAddress)
  return {contract, account}
}

const highlightSelectedProposal = (selectedId) => {
  const proposals = document.querySelectorAll('.proposal');
  proposals.forEach(proposal => {
      proposal.classList.remove('selected');
      const radio = proposal.querySelector(`input[value="${selectedId}"]`);
      if (radio && radio.checked) {
          proposal.classList.add('selected');
      }
  });
}

const displayProposals = async () => {
  const {contract, account} = await getContract()
  
  const proposals = await contract.methods.list().call({from: account})
  console.log(proposals)
  
  const proposalsContainer = document.getElementById('proposals');
  proposalsContainer.innerHTML = '';
  proposals.forEach((proposal, index) => {
      const proposalDiv = document.createElement('div');
      proposalDiv.className = 'proposal';
      proposalDiv.innerHTML = `
          Select: <input type="radio" name="selectedProposal" value="${index}" onclick="highlightSelectedProposal(${index})">
          <p>Proposal ID: ${index}</p>
          <p>Proposer: ${proposal.proposer}</p>
          <p>Description: ${proposal.description}</p>
          <p>Total Vote Count: ${proposal.totalVoteCount}</p>
          <p>Approval Count: ${proposal.approvalCount}</p>
          <p>Is Approved: ${proposal.isApproved}</p>
          <p>Is Executed: ${proposal.isExecuted}</p>
      `;
      if (proposal.isExecuted) {
          proposalDiv.classList.add('executed');
      } else if (proposal.isApproved) {
          proposalDiv.classList.add('approved');
      }
      proposalsContainer.appendChild(proposalDiv);
  });
}

function getSelectedProposalId() {
  const radios = document.getElementsByName('selectedProposal');
  for (const radio of radios) {
      if (radio.checked) {
          return radio.value;
      }
  }
  return null;
}

const createProposal = async () => {
  const description = document.getElementById('description').value;
  if (!description) {
    alert('Please enter a description');
    return;
  }
  try {
    showLoading();
    const {contract, account} = await getContract()
    const result = await contract.methods.create(description).send({from: account})
    console.log(result)
    await displayProposals()
  } catch (err) {
    console.error(err)
  } finally {
    hideLoading();
  }
}

const vote = async () => {
  const proposalId = getSelectedProposalId();
  if (!proposalId) {
    alert('Please select a proposal');
    return;
  }
  try {
    showLoading();
    const approve = document.getElementById('vote').value === 'true';
    const {contract, account} = await getContract()
    const result = await contract.methods.vote(proposalId, approve).send({from: account})
    console.log(result)
    await displayProposals()
  } catch (err) {
    console.error(err)
  } finally {
    hideLoading();
  }
}

const tallyProposal = async () => {
  const proposalId = getSelectedProposalId();
  if (!proposalId) {
    alert('Please select a proposal');
    return;
  }
  try {
    showLoading();
    const {contract, account} = await getContract()
    const result = await contract.methods.tally(proposalId).send({from: account})
    console.log(result)
    await displayProposals()
  } catch (err) {
    console.error(err)
  } finally {
    hideLoading();
  }
}

const executeProposal = async (pid) => {
  const proposalId = getSelectedProposalId();
  if (!proposalId) {
    alert('Please select a proposal');
    return;
  }
  try {
    showLoading();
    const {contract, account} = await getContract()
    const result = await contract.methods.execute(proposalId).send({from: account})
    console.log(result)
    await displayProposals()
  } catch (err) {
    console.error(err)
  } finally {
    hideLoading();
  }
}

const ContractABI = [{"type":"function","name":"create","inputs":[{"name":"description","type":"string","internalType":"string"}],"outputs":[{"name":"pid","type":"uint256","internalType":"uint256"}],"stateMutability":"nonpayable"},{"type":"function","name":"execute","inputs":[{"name":"pid","type":"uint256","internalType":"uint256"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"list","inputs":[],"outputs":[{"name":"","type":"tuple[]","internalType":"struct Schema.Proposal[]","components":[{"name":"proposer","type":"address","internalType":"address"},{"name":"description","type":"string","internalType":"string"},{"name":"totalVoteCount","type":"uint256","internalType":"uint256"},{"name":"approvalCount","type":"uint256","internalType":"uint256"},{"name":"isApproved","type":"bool","internalType":"bool"},{"name":"isExecuted","type":"bool","internalType":"bool"}]}],"stateMutability":"view"},{"type":"function","name":"propose","inputs":[],"outputs":[{"name":"pid","type":"uint256","internalType":"uint256"}],"stateMutability":"nonpayable"},{"type":"function","name":"tally","inputs":[{"name":"pid","type":"uint256","internalType":"uint256"}],"outputs":[],"stateMutability":"nonpayable"},{"type":"function","name":"vote","inputs":[{"name":"pid","type":"uint256","internalType":"uint256"},{"name":"approve","type":"bool","internalType":"bool"}],"outputs":[],"stateMutability":"nonpayable"}]

const ContractAddress = '0x8E4f189Cd541EF56398BBA3CB4d8627Dd3696557';
