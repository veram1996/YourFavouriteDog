//
//  Dashboard.swift
//  FindYourDog
//
//  Created by Dheeraj Verma on 17/11/21.
//

import SwiftUI
import Kingfisher

struct Dashboard: View {
    @StateObject var dashboardViewModel: DashboardViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List(0..<(dashboardViewModel.dogsBreeds?.count ?? 0), id: \.self) { index in
                    NavigationLink(destination: DetailsView(dogsBreed: dashboardViewModel.dogsBreeds?[index])) {
                        HStack(alignment: .top) {
                            KFImage.url(URL(string: dashboardViewModel.dogsBreeds?[index].image?.url ?? "")!)
                                .resizable()
                                .frame(width: 60, height: 60, alignment: .center)
                                .clipShape(Circle())
                            VStack(alignment: .leading, spacing: 0) {
                                HStack(alignment: .top) {
                                    Text("Name : ")
                                        .font(.caption)
                                        .foregroundColor(Color.gray)
                                    Text(dashboardViewModel.dogsBreeds?[index].name ?? "")
                                        .font(.headline.bold())
                                }
                                
                                HStack(alignment: .top) {
                                    Text("Origin : ")
                                        .font(.caption)
                                        .foregroundColor(Color.gray)
                                    Text(dashboardViewModel.dogsBreeds?[index].origin ?? "---")
                                        .font(.footnote)
                                }
                                .padding(.vertical, 8)
                                HStack(alignment: .top) {
                                    Text("Life Span : ")
                                        .font(.caption)
                                        .foregroundColor(Color.gray)
                                    Text(dashboardViewModel.dogsBreeds?[index].lifeSpan ?? "---")
                                        .font(.footnote)
                                }
                                
                            }
                            .padding(.bottom, 15)
                        }
                    }
                }
            }
            .animation(.easeIn)
            .background(Color("background"))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationBarTitle("Find Your Favourite Dog")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                dashboardViewModel.getListOfBreed()
            })
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

