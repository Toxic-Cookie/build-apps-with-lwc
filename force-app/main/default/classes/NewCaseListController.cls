public with sharing class NewCaseListController {
    public List<Case> newCases { get { return getNewCases();} set; }
    public List<Case> getNewCases() 
    {
        List<Case> results = Database.query('SELECT Id, CaseNumber, Subject FROM Case WHERE Status = \'New\' ORDER BY CreatedDate DESC LIMIT 10');
        return results;
    }
}