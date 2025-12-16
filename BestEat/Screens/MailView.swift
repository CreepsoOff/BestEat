//
//  MailView.swift
//  BestEat
//
//  Created by apprenant98 on 15/12/2025.
//

import SwiftUI

struct MailView: View {
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    MailDetailView()
                } label: {
                    HStack(spacing: 10) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.fill)
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Medium")
                                .fontWeight(.semibold)
                            
                            Text("Your article published")
                                .font(.caption)
                        }
                    }
                }
            }
            .navigationTitle("Mail")
            .navigationSubtitle("Updated 2 days ago")
            .toolbar(id: "WRITEACTION") {
                ToolbarItem(id: "WRITE", placement: .bottomBar) {
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                    }
                }

                ToolbarSpacer(.fixed, placement: .bottomBar)
                
                DefaultToolbarItem(kind: .search, placement: .bottomBar)
                
                ToolbarSpacer(.fixed, placement: .bottomBar)
            }
            .searchable(text: $searchText)
        }
    }
}

struct MailDetailView: View {
    var body: some View {
        VStack {
            
        }
        .navigationTitle("Medium")
        .toolbar(id: "WRITEACTION") {
            ToolbarItem(id: "WRITE", placement: .bottomBar) {
                Button {
                    
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                HStack(spacing: 12) {
                    Button {
                        
                    } label: {
                        Image(systemName: "trash")
                            .padding(.horizontal, 5)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "folder")
                            .padding(.horizontal, 5)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "arrowshape.turn.up.forward.fill")
                            .padding(.horizontal, 5)
                    }
                }
                .padding(.horizontal, 5)
                .buttonStyle(.plain)
            }
            
            ToolbarSpacer(.flexible, placement: .bottomBar)
        }
    }
}

#Preview {
    MailView()
}
