//
//  ProgramsViewModel.swift
//  Demo-App
//
//  Created by Saravanan Rethinam.
//

import Foundation

class ProgramsViewModel : NSObject {
        
    private var apiService : ProgramEntriesWebService!
    
    public var programData : Programs! {
        didSet {
            self.updateViewWithLatetData()
        }
    }
    
    var updateViewWithLatetData : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  ProgramEntriesWebService(urlString: ProgramsFeatureStrings.programEntriesUrl)
        getProgramEntriesData()
    }
    
    func getProgramEntriesData() {
        self.apiService.fetchProgramEntriesData { [weak self] program, _  in
            guard let strongSelf = self else { return }
            strongSelf.programData = program
        }
    }
}
