/*
*	Author: Subham Podder
*	Description: Coding Challenge - Apex class to check if there exists a path between two nodes in a network
*	Created Date: 20-04-2022
*	Last Modified: 20-04-2022 
*/
public class CodingChallenge {
    
    Set<Connection> connections = new Set<Connection>();
    Map<Connection,String> connectionNetworks = new Map<Connection,String>();
    private final String networkName = 'N'; 
    
    //method to connect two nodes
    public void connect(Integer nodeSource, Integer nodeDestination){
        Integer networkNumber = 1;
        Connection con = new Connection(nodeSource, nodeDestination);
        connections.add(con);
        
        //inserting first network with default name
        if(connectionNetworks.isEmpty() || connectionNetworks == NULL){
            connectionNetworks.put(con, networkName+networkNumber);
        }else{
            String check = checkExistingConnection(con);
            if(check.equalsIgnoreCase(networkName)){
                networkNumber++;
                connectionNetworks.put(con, networkName+networkNumber);
            }else{
                connectionNetworks.put(con, check);
            }
        }
    }
    
    //method to check existing connection  
    public String checkExistingConnection(Connection newConnection){
        for(Connection existingConnection : connectionNetworks.keySet()){
            if(existingConnection.nodeA == newConnection.nodeA 
               || existingConnection.nodeA == newConnection.nodeB 
               || existingConnection.nodeB == newConnection.nodeA 
               || existingConnection.nodeB == newConnection.nodeB){
                   return connectionNetworks.get(existingConnection);
               }
        }
        return networkName;
    }
    
    //method to check connection between two nodes
    public Boolean isConnected(Integer nodeSource, Integer nodeDestination){
        Boolean isConnected = false;
        String sourceNetwork;
        String destinationNetwork;
        
        //getting source and destination networks for each node
        for(Connection con : connectionNetworks.keySet()){
            if(con.nodeA == nodeSource || con.nodeB == nodeSource){
                sourceNetwork = connectionNetworks.get(con);
            }
            if(con.nodeA == nodeDestination || con.nodeB == nodeDestination){
                destinationNetwork = connectionNetworks.get(con);
            }
        }
        
        //checking if both the nodes lie in the same network
        if(sourceNetwork.equalsIgnoreCase(destinationNetwork)){
            isConnected = true;
        }
       
        return isConnected;
    }
}