import UIKit

/*
 Given a list of airline tickets represented by pairs of departure and arrival airports [from, to], reconstruct the itinerary in order. All of the tickets belong to a man who departs from JFK. Thus, the itinerary must begin with JFK.

 Note:

 If there are multiple valid itineraries, you should return the itinerary that has the smallest lexical order when read as a single string. For example, the itinerary ["JFK", "LGA"] has a smaller lexical order than ["JFK", "LGB"].
 All airports are represented by three capital letters (IATA code).
 You may assume all tickets form at least one valid itinerary.
 One must use all the tickets once and only once.
 Example 1:

 Input: [["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]]
 Output: ["JFK", "MUC", "LHR", "SFO", "SJC"]
 Example 2:

 Input: [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
 Output: ["JFK","ATL","JFK","SFO","ATL","SFO"]
 Explanation: Another possible reconstruction is ["JFK","SFO","ATL","JFK","ATL","SFO"].
              But it is larger in lexical order.
 */

class Solution {
    private var sourceToDest: [String: [String]] = [:]
    private var numberOfTickets: Int = 0
    private var usedTickets: [String: [Int]] = [:]

    func findItinerary(_ tickets: [[String]]) -> [String] {
        
        for ticket in tickets {
            guard let ticketSource = ticket.first, let ticketDest = ticket.last else { continue }
            addTicketDestLexically(ticketDest, to: ticketSource)
        }
        print(sourceToDest)
        
        numberOfTickets = tickets.count
        
        var itinerary: [String] = []
        startItinerary(from: "JFK", itinerary: &itinerary)
        print(itinerary)
        return itinerary
    }
    
    private func addTicketDestLexically(_ dest: String, to source: String) {
        guard var destinations = sourceToDest[source] else {
            sourceToDest[source] = [dest]
            return
        }
        destinations.append(dest)
        destinations.sort()
        sourceToDest[source] = destinations
    }
    
    private func startItinerary(from source: String, itinerary: inout [String]) -> Bool {
        
        itinerary.append(source)
        
        guard itinerary.count != numberOfTickets + 1 else {
            return true
        }
        
        guard let sourceDestinations = sourceToDest[source] else {
            return false
        }
        
        
        var isValid: Bool = false
        var sourceDestinationIndex = 0
        while isValid != true, sourceDestinationIndex < sourceDestinations.count {
            let destination = sourceDestinations[sourceDestinationIndex]
            if let anyUsedTicketForSource = usedTickets[source] {
                if anyUsedTicketForSource.contains(sourceDestinationIndex) {
                    sourceDestinationIndex += 1
                    continue
                } else {
                    usedTickets[source]?.append(sourceDestinationIndex)
                }
            } else {
                usedTickets[source] = [sourceDestinationIndex]
            }
            isValid = startItinerary(from: destination, itinerary: &itinerary)
            if !isValid {
                itinerary.removeLast()
                sourceDestinationIndex += 1
                usedTickets[source]?.removeLast()
            }
        }
        
        return isValid
    }
}

let sol = Solution()
//sol.findItinerary([["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]])
//sol.findItinerary([["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]])
//sol.findItinerary([["JFK","SFO"],["SFO","JFK"]])
//sol.findItinerary([["JFK","SFO"],["SFO","ATL"],["ATL","MAU"],["MAU","LHR"], ["JFK","ESR"], ["LHR","JFK"]])
sol.findItinerary([["EZE","AXA"],["TIA","ANU"],["ANU","JFK"],["JFK","ANU"],["ANU","EZE"],["TIA","ANU"],["AXA","TIA"],["TIA","JFK"],["ANU","TIA"],["JFK","TIA"]])
