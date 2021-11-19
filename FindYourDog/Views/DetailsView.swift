//
//  DetailsView.swift
//  FindYourDog
//
//  Created by Dheeraj Verma on 20/11/21.
//

import SwiftUI
import Kingfisher

struct DetailsView: View {
    var dogsBreed: BreedModel?
    var body: some View {
        ScrollView {
            VStack {
                KFImage.url(URL(string: dogsBreed?.image?.url ?? "")!)
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipShape(Circle())
                Group {
                    VStack(alignment: .leading) {
                        Text("Details")
                        HStack(alignment: .top) {
                            Text("Name : ")
                                .font(.callout)
                                .foregroundColor(Color.gray)
                            Text(dogsBreed?.name ?? "")
                            Spacer()
                        }
                        .padding(.bottom, 8)
                        HStack(alignment: .top) {
                            Text("Origin : ")
                                .font(.callout)
                                .foregroundColor(Color.gray)
                            Text(dogsBreed?.origin ?? "---")
                           Spacer()
                        }
                        .padding(.bottom, 8)
                        HStack(alignment: .top) {
                            Text("Life Span : ")
                                .font(.callout)
                                .foregroundColor(Color.gray)
                            Text(dogsBreed?.lifeSpan ?? "---")
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.all, 16)
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(12)
                
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 20)
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("background"))
        .edgesIgnoringSafeArea(.bottom)
    }
}

